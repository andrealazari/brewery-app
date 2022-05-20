likes = [{"brewery_id"=>"14"}, {"brewery_id"=>"14"}, {"brewery_id"=>"12"}]

def count_likes(likes_array)
    final_counts = {}
    likes_array.each do |like|
        brew_id = like['brewery_id']
        if final_counts[brew_id]
            final_counts[brew_id] = final_counts[brew_id] + 1
        else
            final_counts[brew_id] = 1
        end
    end
    final_counts
end

p count_likes(likes)