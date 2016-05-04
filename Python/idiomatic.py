# Control Structures and Functions

# Chain comparisons to make if statements more concise
if x <= y <= z: 
	return True

# Avoid placing conditional branch code on the same line as the colon
name = 'Jeff'
address = 'New York, NY'
	if name: print(name)
print(address)
# harmful
if name: print(name)

# Avoid repeating variable name in compound if statement
name = 'Tom'
is_generic_name = name in ('Tom', 'Dick', 'Harry')
# harmful
is_generic_name = False
name = 'Tom'
if name == 'Tom' or name == 'Dick' or name == 'Harry':
    is_generic_name = True

# Avoid comparing directly to True, False, or None

