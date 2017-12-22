# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookshelf.Repo.insert!(%Bookshelf.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Bookshelf.Repo.insert!(%Bookshelf.Store.LearningResource{
  title: "Phoenix for Rails Developers",
  description: "it's a book",
  type: "book",
  url: "http://www.phoenixforrailsdevelopers.com",
  preview_image_url: "http://www.phoenixforrailsdevelopers.com/images/cover.jpg"
})

Bookshelf.Repo.insert!(%Bookshelf.Store.LearningResource{
  title: "Learn CSS grid",
  description: "it's a video",
  type: "video",
  url: "https://scrimba.com/g/gR8PTE",
})
