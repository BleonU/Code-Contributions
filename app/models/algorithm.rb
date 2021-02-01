class Algorithm

  def initialize(name, commit_id, current_commit, previous_commit)
    @name = name
    @id = commit_id
    @current = current_commit
    @previous = previous_commit
  end

  def changesinlines
    prevlines = @current.lines.map(&:chomp)
    currentlines = @previous.lines.map(&chomp)
    # if prevlines.length < currentlines.length
    #   size = prevlines.length
    # else
    #   size = currentlines.length
    #   end
    prevsize = prevlines.length
    currentsize = currentlines.length
    samelines = 0
    addedlines = 0
    removedlines = 0
    listofindex = []
    changed = false
    (0..prevsize).each do |i|
      (0..currentsize).each do |j|
        if j != currentsize
          if prevlines[i] == currentlines[j]
            samelines += 1
            break
          elsif prevlines[i] != currentlines[j]
            listofindex.append(i, j)
            addedlines += 1
          end
        elsif j == currentsize
          if prevlines[i] == currentlines[j]
            samelines += 1
            break
          elsif prevlines[i] != currentlines[j]
            listofindex.append(i, j)
            removedlines += 1
          end
        end
      end
    end
    indexsize = listofindex.length
    (0..indexsize).each do |i|
      prevchars = prevlines[listofindex[i][0]].gsub(/\s+/, "")
      currentchars = currentsize[listofindex[i][1]].gsub(/\s+/, "")
      if prevchars == currentchars
        addedlines -= 1
      end
    end
    listofvalues = [prevsize - samelines, addedlines, removedlines]
    listofvalues.join(", ")
  end

  def printdetails
    list1 = [@name, @id, @current, @previous]
    list1.join(", ")
  end
end
