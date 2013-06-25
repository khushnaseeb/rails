
opt=""

optrnd=[]
optmethod= Proc.new{|n| 

for i in 1..n
3.times do
opt<< (97+rand(25)).chr
end

optrnd << opt
end
}

optmethod.call(4)
p optrnd
