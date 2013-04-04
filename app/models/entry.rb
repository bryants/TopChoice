class Entry < ActiveRecord::Base
  FORM_OPTIONS = ['ruby', 'javascript', 'python', 'php', 'other']
  #attr_accessible :choice

  def self.get_results
    counts = Entry.count({ :group => :choice })
    FORM_OPTIONS.map do |o|
    {
      'title' => o,
      'votes' => counts[o]||0
    }
    end
  end
end
