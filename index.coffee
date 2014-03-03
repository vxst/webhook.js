express=require 'express'
app=express()
app.use express.logger 'dev'
exec = require('child_process').exec

webHooks={}

app.post '/webhooks/:hook/key/:key',(req,res)->
	if not webHooks[req.params.hook]?
		res.send {'status':'error', 'reason':'no such hook'}
		return
	if webHooks[req.params.hook]['key']!=req.params.key
		res.send {'status':'error', 'reason':'wrong password'}
		return
	exec webHooks[req.params.hook]['script'], (err,out)->
		if err?
			res.send {'status':'error', 'reason':'exec error'}
		else
			res.send {'status':'ok'}
app.listen 1870
console.log 'App started at 1870'
