
arr = [['1','2'],['3','44'],['5','6'],['7','8']]
p arr
arr.each{|i,j| if j == '44'
  j.replace('7777')
  end}

p arr