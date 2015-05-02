
timea = ["9:30am-9:50am", "9:50am-10:10am", "10:10am-10:30am", "10:30am-10:50am", "10:50am-11:10am", "11:10am-11:30am"]
timeb = ["3:00pm-3:20pm", "3:20pm-3:40pm", "3:40pm-4:00pm", "4:00pm-4:20pm", "4:20pm-4:40pm", "4:40pm-5:00pm"]
timec = ["1:00pm-1:30pm", "1:30pm-2:00pm", "2:00pm-2:30pm", "2:30pm-3:00pm"]
de = ["B.S","M.S","PH.D"]
posty = ["Full-time", "Internship"]
rand(timea.length)
rand(timeb.length)
rand(timec.length)
fname = "studentscript.txt"
somefile = File.open(fname, "w")
i=0
while i<100
name = "student#{i}"
UIN = rand(100000000..200000000).to_s
email = "#{rand(19999)}@gmail.com"
US = rand(2)==1 ? true : false
deg = de[rand(3)] 
pos = posty[rand(2)]
Mok1 = rand(2)==1 ? timec[rand(4)] : "Not attend"
Mok2 = rand(2)==1 ? timec[rand(4)] : "Not attend"
cli1 = rand(2)==1 ? timea[rand(6)] : "Not attend"
cli2 = rand(2)==1 ? timec[rand(6)] : "Not attend"
cli3 = rand(2)==1 ? timea[rand(6)] : "Not attend"
somefile.puts "Student.create(name: \"#{name}\", UIN: \"#{UIN}\",email: \"#{email}\", US_Citizen: \"#{US}\", degree: \"#{deg}\", position_type: \"#{pos}\", Mock_1: \"#{Mok1}\",Mock_2: \"#{Mok2}\", Resume_1: \"#{cli1}\",  Resume_2: \"#{cli2}\", Resume_3: \"#{cli3}\", Lunch: \"Not attend\")"

i+=1
end

somefile.close

	