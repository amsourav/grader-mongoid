t= Teacher.find_by(email: 'souravsrkr254@gmail.com')
jobs= t.jobs
jobs.each do |j|
  g= j.build_grade  
  g.mark= 5  
  g.comment = (0..50).map { ('a'..'z').to_a[rand(26)] }.join
  g.annotation = "[{\"x\":441,\"y\":304,\"c\":0},{\"x\":478,\"y\":265,\"c\":1},{\"x\":503,\"y\":220,\"c\":1},{\"x\":524,\"y\":179,\"c\":1},{\"x\":552,\"y\":163,\"c\":1},{\"x\":577,\"y\":160,\"c\":1},{\"x\":577,\"y\":160,\"c\":1},{\"x\":576,\"y\":163,\"c\":1},{\"x\":535,\"y\":218,\"c\":1},{\"x\":502,\"y\":246,\"c\":1},{\"x\":458,\"y\":289,\"c\":1},{\"x\":408,\"y\":348,\"c\":1},{\"x\":382,\"y\":377,\"c\":1},{\"x\":369,\"y\":396,\"c\":1},{\"x\":363,\"y\":407,\"c\":1},{\"x\":362,\"y\":413,\"c\":1},{\"x\":362,\"y\":413,\"c\":1},{\"x\":362,\"y\":412,\"c\":1},{\"x\":424,\"y\":312,\"c\":1},{\"x\":455,\"y\":276,\"c\":1},{\"x\":456,\"y\":274,\"c\":1},{\"x\":454,\"y\":275,\"c\":1},{\"x\":414,\"y\":291,\"c\":1},{\"x\":356,\"y\":361,\"c\":1},{\"x\":266,\"y\":408,\"c\":1},{\"x\":167,\"y\":438,\"c\":1},{\"x\":119,\"y\":463,\"c\":1},{\"x\":163,\"y\":356,\"c\":1},{\"x\":298,\"y\":287,\"c\":1},{\"x\":366,\"y\":267,\"c\":1},{\"x\":414,\"y\":267,\"c\":1},{\"x\":466,\"y\":266,\"c\":1},{\"x\":484,\"y\":266,\"c\":1},{\"x\":484,\"y\":267,\"c\":1},{\"x\":382,\"y\":366,\"c\":1},{\"x\":320,\"y\":437,\"c\":1},{\"x\":214,\"y\":572,\"c\":1},{\"x\":149,\"y\":635,\"c\":1},{\"x\":129,\"y\":641,\"c\":1},{\"x\":127,\"y\":641,\"c\":1},{\"x\":130,\"y\":638,\"c\":1},{\"x\":225,\"y\":563,\"c\":1},{\"x\":299,\"y\":451,\"c\":1},{\"x\":425,\"y\":384,\"c\":1},{\"x\":503,\"y\":315,\"c\":1},{\"x\":529,\"y\":309,\"c\":1},{\"x\":532,\"y\":309,\"c\":1},{\"x\":532,\"y\":312,\"c\":1},{\"x\":525,\"y\":333,\"c\":1},{\"x\":498,\"y\":360,\"c\":1},{\"x\":456,\"y\":391,\"c\":1},{\"x\":407,\"y\":462,\"c\":1},{\"x\":380,\"y\":498,\"c\":1},{\"x\":372,\"y\":515,\"c\":1},{\"x\":371,\"y\":517,\"c\":1},{\"x\":371,\"y\":517,\"c\":1},{\"x\":375,\"y\":517,\"c\":1},{\"x\":481,\"y\":444,\"c\":1},{\"x\":550,\"y\":372,\"c\":1},{\"x\":627,\"y\":350,\"c\":1},{\"x\":654,\"y\":344,\"c\":1},{\"x\":661,\"y\":344,\"c\":1},{\"x\":661,\"y\":344,\"c\":1},{\"x\":661,\"y\":345,\"c\":1},{\"x\":661,\"y\":345,\"c\":1},{\"x\":661,\"y\":345,\"c\":1}]"  
  g.teacher_id = j.teacher.id  
  g.student_id = j.student.id  
  g.save
end  