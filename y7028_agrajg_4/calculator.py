print' hello world'
exp=raw_input("Enter a Mathematical Expression with spaces : " )


def add(x,y):
    return x+y

def substract(x,y):
    return x-y

def multiply(x,y):
    return x*y

def divide(x,y):
    if y!=0:
        return x*1.0/y
    else:
        print 'Cannot devide by 0'
def modulus(x,y):
    if y!=0:
        return x%y
    else:
        print 'Cannot devide by 0'
    
    
def solvebracket(comexp):
    
    
    j=0   
    while(j<len(comexp)):
        if comexp[j] == '/':
            divideat = j
            div = divide(float(comexp[divideat-1]),float(comexp[divideat+1]))
            comexp[divideat-1] = div
            comexp[divideat:divideat+2] = []       
            
        else:
            j+=1
    
    
    j=0    
    while(j<len(comexp)):
        if comexp[j] == '*':
            mulat = j
            mul = multiply(float(comexp[mulat-1]),float(comexp[mulat+1]))
            comexp[mulat-1] = mul
            comexp[mulat:mulat+2] = []
            
        else:
            j+=1
    

    j=0   
    while(j<len(comexp)):
        if comexp[j] == '%':
            modat = j
            mod = modulus(float(comexp[modat-1]),float(comexp[modat+1]))
            comexp[modat-1] = mod
            comexp[modat:modat+2] = []       
            
        else:
            j+=1
    

    j=0    
    while(j<len(comexp)):
        if comexp[j] == '-':
            subat = j
            sub = substract(float(comexp[subat-1]),float(comexp[subat+1]))
            comexp[subat-1] = sub
            comexp[subat:subat+2] = []
            
        else:
            j+=1        
    


    j=0    
    while(j<len(comexp)):
        if comexp[j] == '+':
            addat = j
            addt = add(float(comexp[addat-1]),float(comexp[addat+1]))
            comexp[addat-1] = addt
            comexp[addat:addat+2] = []          
            
        else:
            j+=1
    
           
        
    
    if len(comexp) == 1:
        return comexp

def checkbrackets(expression):
    counter=0
    while(counter < len(expression)):
        if expression[counter] == '(':
            
            return True
        counter+=1;
        

#main program

i=-1   
exparray = exp.split(' ')
braces = False
braces = checkbrackets(exparray)

firstbracketat = -1
secondbracketat = -1

while(braces):
    i=-1
    firstbracketat = -1
    secondbracketat = -1
    for element in exparray:
        i+=1
        if element == '(':
            firstbracketat = i
        if element == ')':
            secondbracketat = i
            break
    expinbracket = exparray[firstbracketat+1:secondbracketat]
    
    
    solveinbrec = solvebracket(expinbracket)
    
    
    exparray[firstbracketat]=solveinbrec[0]
    exparray[firstbracketat+1:secondbracketat+1]=[]
    braces = checkbrackets(exparray)


final = solvebracket(exparray)

print final[0]

    


    
  





             
        

        
             
         
         






