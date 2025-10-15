import ast
from os import link
with open ("all_link.txt",'r') as file:
    content=file.read()

links=ast.literal_eval(content)
# print(type(links))
print(len(links))