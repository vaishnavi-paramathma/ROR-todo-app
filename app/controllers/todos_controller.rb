class TodosController < ApplicationController
  def index
     @todos =Todo.all.map{|todo| todo}
  end
  def create
    create_meth = Todo.new(
      task: params[:task] ,
      date: params[:date]   
    )
      if create_meth.save
        redirect_to todos_path
      else
        render plain: "fail"
      end
  end
  def update
    id = params[:id]
   find_id = Todo.find(id)
   find_id.status = params[:status]
   find_id.save
   redirect_to todos_path
  end
  def destroy 
   id = params[:id]
   todo= Todo.find(id)
   todo.destroy
   todo.save
   redirect_to todos_path
  end
end
