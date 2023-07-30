# frozen_string_literal: true

group_members = %w[A B C D E F].shuffle

if %w[pattern1 pattern2].sample == 'pattern1'
  p group_members[0..2].sort
  p group_members[3..5].sort
else
  p group_members[0..1].sort
  p group_members[2..5].sort
end
