every :day, :at => '12:00pm', :roles => [:app] do
  runner "Ad.task_to_published"
end


every :day, :at => '11:50 pm' do
  runner "Ad.task_to_move_archive"
end
