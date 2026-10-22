require('dotenv').config({path:".env"})
const cors = require('cors')
const express = require('express')
const fileUp = require('express-fileupload')
const path = require('path')
const app = express()

app.use(cors({
    origin:"http://localhost:3000",
    credentials: true
}))

app.use(express.json())
app.use(fileUp())
app.use('/uploads',express.static(path.join(__dirname,'./uploads')))

const auth = require('./routes/auth')
app.use('/api/auth',auth)

const profile = require('./routes/profile')
app.use('/api/profile',profile)

const docnoe = require('./routes/docnoe')
app.use('/api/docnoe',docnoe)

//eva

const selfeva = require('./routes/Eva/selfeva')
app.use('/api/Eva/selfeva',selfeva) 

const edit_eva = require('./routes/Eva/edit_eva')
app.use('/api/Eva/edit_eva',edit_eva) 

const score_member = require('./routes/Eva/score_member')
app.use('/api/Eva/score_member',score_member) 

const score_commit = require('./routes/Eva/score_commit')
app.use('/api/Eva/score_commit',score_commit) 

//staff

const member = require('./routes/Staff/member')
app.use('/api/Staff/member',member)

const topic = require('./routes/Staff/topic')
app.use('/api/Staff/topic',topic)

const indicate = require('./routes/Staff/indicate')
app.use('/api/Staff/indicate',indicate)

const eva = require('./routes/Staff/eva')
app.use('/api/Staff/eva',eva)

const system = require('./routes/Staff/system')
app.use('/api/Staff/system',system)

const commit = require('./routes/Staff/commit')
app.use('/api/Staff/commit',commit)

const doc = require('./routes/Staff/doc')
app.use('/api/Staff/doc',doc)

const score_member3 = require('./routes/Staff/score_member')
app.use('/api/Staff/score_member',score_member3)

const score_commit3 = require('./routes/Staff/score_commit')
app.use('/api/Staff/score_commit',score_commit3)

const status = require('./routes/Staff/status')
app.use('/api/Staff/status',status)

const backup = require('./routes/Staff/backup')
app.use('/api/Staff/backup',backup)

app.use((req,res)=> res.status(404).json({message:"Route Not found"}))
app.listen(3001,()=>{
    console.log("Server running on port 3001");
    
})