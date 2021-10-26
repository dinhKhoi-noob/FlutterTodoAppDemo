const nullCheck = (req,res,next) =>{
    const {name,priority,description,dueDate} = req.body;
    if(!name || !priority || !description || !dueDate){
        return res.status(400).json({success:false,message:"Please enter all field!"});
    }
    if(name.length > 100 || !priority > 10 || !priority < 0 || description.length > 250){
        return res.status(400).json({success:false,message:"Invalid input, try again!"});
    }
    next();
}

const dateCheck = (req, res, next) => {
    const {dueDate} = req.body;
    const dateFormat = /^(((\d{4})(-)(0[13578]|10|12)(-)(0[1-9]|[12][0-9]|3[01]))|((\d{4})(-)(0[469]|11)(-)(0[1-9]|[12][0-9]|30))|((\d{4})(-)(02)(-)(0[1-9]|[12][0-9]|2[0-8]))|(([02468][048]00)(-)(02)(-)(29))|(([13579][26]00)(-)(02)(-)(29))|(([0-9][0-9][0][48])(-)(02)(-)(29))|(([0-9][0-9][2468][048])(-)(02)(-)(29))|(([0-9][0-9][13579][26])(-)(02)(-)(29)))(\s)(([0-1][0-9]|2[0-4]):([0-5][0-9]):([0-5][0-9]))$/;
    if(!dateFormat.test(dueDate))
        return res.status(400).json({success: false, message:"Invalid input date"});
    next();
}

module.exports = {
    nullCheck,
    dateCheck
}