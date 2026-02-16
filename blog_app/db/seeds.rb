Comment.destroy_all
Blog.destroy_all

5.times do |i|
  blog = Blog.create!(
    title: "Published Blog Post #{i + 1}",
    body: "This is the body of published blog post #{i + 1}.",
    published: true
  )

  puts "Created published blog: #{blog.title}"

  3.times do |j|
    blog.comments.create!(
      content: "This is comment #{j + 1} for published blog #{i + 1}."
    )
    puts "  -> Created comment for blog: #{blog.title}"
  end
end

5.times do |i|
  blog = Blog.create!(
    title: "Unpublished Blog Post #{i + 1}",
    body: "This is the body of unpublished blog post #{i + 1}.",
    published: false
  )
  puts "Created unpublished blog: #{blog.title}"
end
