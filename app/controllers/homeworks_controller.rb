class HomeworksController < ApplicationController
  def index
    @homeworks = Homework.all
  end
end
