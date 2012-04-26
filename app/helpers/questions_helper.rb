module QuestionsHelper
  def add_choice_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :choices, partial: 'choice', object: Choice.new
    end
  end
end
