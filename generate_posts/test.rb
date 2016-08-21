require 'csv'

CSV.foreach('jekyll.csv') do |row|
  

	uid = row[0]
	title = row[1]
	filename = row[4]
	date = row[5]
	worktype = row[6]
	categories = row[7]
	imageUrl = row[8]
	itemUrl = row[9]
	description = row[10]
	episodeUrl = row[11]

		array = Array.new

		array << "---"
		array << "layout: post-wide"
		array << "uid: " + uid
		array << "title: " + "\"" + title + "\""
		array << "worktype: \"Development\""
		array << "date: " + date
		
		if categories.nil? || categories == 0
			categories = "none"
		end

			array << "categories: " + categories

		if imageUrl.nil? || imageUrl == 0
			imageUrl = "book-cover-blank.jpg"
		end

		array << "image-url: " + imageUrl

		array << "item-url: " + itemUrl
		array << "description: " + "\"" + description + "\""
		array << "---"

		unless imageUrl.nil? || imageUrl == 0
		array << "<a href=\"" + itemUrl + "\" target=\"blank\">" + "<img src=\"../../../../img/thumbs/" + imageUrl + "\" class=\"prod-img\"></a>"
		end

		array << "<h2>" + title + "</h2>"
		array << "<p><a href=\"" + itemUrl + "\" target=\"blank\">" "Get it on Amazon</a><p>"
		array << "<p>Mentioned in: <a href=\"" + episodeUrl + "\" target=\"blank\">" + description + "</a></p>"

		out_file = File.new((filename + ".markdown"), "w")

		out_file.puts(array.join("\n"))

		out_file.close



end
