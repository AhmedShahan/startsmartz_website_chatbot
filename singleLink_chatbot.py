# import ast
# from os import link
# with open ("all_link.txt",'r') as file:
#     content=file.read()

# links=ast.literal_eval(content)
# # print(type(links))
# print(len(links))

import json
with open ("/home/shahanahmed/startsmartz_website_chatbot/langchain_all_link.json","r") as file:
    data = json.load(file)


all_links = data['all_links']
crawled_pages = data['crawled_pages']

# Merge and remove duplicates
All_pages = list(set(all_links) | set(crawled_pages))
# print(All_pages)
# print(len(All_pages))

'''
Filter just langchain, langgraph, langsmith, keyworkds link. Otehrs should be deleted.
'''
keywords = ["langchain", "langgraph", "langsmith"]
# Filter links that contain any of the keywords
filtered_links = [link for link in All_pages if any(keyword in link.lower() for keyword in keywords)]
print(filtered_links)

first_page=filtered_links[0]


# print("Webpage: ",first_page)


from langchain_community.document_loaders import SeleniumURLLoader
from langchain_community.document_loaders import WebBaseLoader
from langchain_community.document_loaders import WebBaseLoader
from langchain.prompts import ChatPromptTemplate
from langchain_google_genai import ChatGoogleGenerativeAI
from langchain_core.output_parsers import StrOutputParser
loader=WebBaseLoader(first_page)

from dotenv import load_dotenv
load_dotenv()
docs=loader.load()

print(docs[0].metadata)



'''
MessageContent=[
    ('system','You are an Expart Assistent for Question Answer From the Given Webpage Content'),
    ('human','Please Answer the Question {question} from the following Content {content}')
]

prompt=ChatPromptTemplate.from_messages(MessageContent)

modelGemini=ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    temperature=0.9
)
parser=StrOutputParser()

chain=prompt | modelGemini | parser

while True:
    question=input("YOU: ")
    response=chain.invoke({
        "question": question,
        "content": docs
    })


    print("\n\nAI: ",response)

'''