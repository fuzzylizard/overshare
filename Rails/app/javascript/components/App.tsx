import React from "react";
import Posts from "./Posts";
import CreatePostForm from "./CreatePostForm";
import Header from "./Header";

const App = () => {
  return (
    <>
      <Header />
      <CreatePostForm />
      <Posts/>
    </>
  );
};

export default App;
