import React, { useEffect, useState } from "react";

function Posts() {
  const [posts, setPosts] = useState([]);

  async function getData() {
    const url = "http://127.0.0.1:3000/posts";
    try {
      const response = await fetch(url, {
        headers: {
          "Content-Type": "application/json",
        },
      });
      if (!response.ok) {
        throw new Error(`Response status: ${response.status}`);
      }

      const result = await response.json();
      setPosts(result);
    } catch (error) {
      console.error(error.message);
    }
  }

  useEffect(() => {
    getData();
  }, []);

  return (
    <div>
      {posts.map((post) => (
        <div className="border-1 p-4 rounded-lg my-5" key={post.id}>
          <p>{post.message}</p>
        </div>
      ))}
    </div>
  );
}

export default Posts;
