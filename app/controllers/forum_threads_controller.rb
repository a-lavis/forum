class ForumThreadsController < ApplicationController
  before_action :set_forum_thread, only: %i[ show edit update destroy ]

  # GET /forum_threads
  def index
    @forum_threads = ForumThread.all
  end

  # GET /forum_threads/1
  def show
  end

  # GET /forum_threads/new
  def new
    @forum_thread = ForumThread.new
  end

  # GET /forum_threads/1/edit
  def edit
  end

  # POST /forum_threads
  def create
    @forum_thread = ForumThread.new(forum_thread_params)
    @forum_thread.author = Current.user

    if @forum_thread.save
      redirect_to @forum_thread, notice: "Forum thread was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /forum_threads/1
  def update
    if @forum_thread.update(forum_thread_params)
      redirect_to @forum_thread, notice: "Forum thread was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /forum_threads/1
  def destroy
    @forum_thread.destroy!
    redirect_to forum_threads_path, notice: "Forum thread was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_thread
      @forum_thread = ForumThread.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def forum_thread_params
      params.expect(forum_thread: [ :title ])
    end
end
