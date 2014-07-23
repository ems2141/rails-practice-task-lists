require 'rails_helper'

describe Task do
  it 'must have a description' do
    task = Task.new(
        description: 'something important'
    )

    expect(task).to be_valid

    task.description = ""
    expect(task).to_not be_valid
  end
end