// The days of the week are: "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
function getDayName(dateString) {
    let dayName;
    // Write your code here
    const weekDays = ['Sunday' ,'Monday', 'Tuesday', 'Wednesday' , 'Thursday' ,'Friday','Saturday' ]
    let d = new Date(dateString);
    let dayNum = d.getDay();
    dayName = weekDays[dayNum]; 
    return dayName;
}