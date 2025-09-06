"""
System   : christianwestbrook.dev
Script   : main.py
Engineer : Christian Westbrook
Abstract : This script defines an API for serving blog content.
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import frontmatter

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=False,
    allow_methods=["GET"],
    allow_headers=["*"],
)

@app.get("/blog/{title}")
def blog(title):
    """
    Endpoint for retrieving the Markdown content of a single blog post.
    """
    file = open(f"blogs/{title}", mode="r", encoding="utf-8")
    markdown = file.read()
    data = frontmatter.loads(markdown)
    content = data.content
    return content
