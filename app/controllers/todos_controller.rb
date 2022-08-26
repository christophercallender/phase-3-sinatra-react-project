class TodosController < ApplicationController
  get "/" do
    todos = Todo.all
    todos.to_json
  end

  get "/todos" do
    todos = Todo.all
    todos.to_json
  end

  post "/todos" do
    todo = Todo.create(params)
    todo.cleanup_database
    todo.to_json
  end

  patch "/todos/:id" do
    todo = Todo.find(params[:id])
    todo.update(params)
    todo.to_json
  end

  patch "/todos/:id/category" do
    todo = Todo.find(params[:id])
    todo.update(params)
    todo.cleanup_database
    todo.to_json
  end

  delete "/todos/:id" do
    todo = Todo.find(params[:id])
    todo.destroy
    todo.cleanup_database
    todo.to_json
  end
end
