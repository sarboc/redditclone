# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  $(".reply-link").click (event) ->
    event.preventDefault()
    $(event.currentTarget).parent().siblings(".reply-form").toggleClass "hidden"

  $(".like-button").click (event) ->
    event.preventDefault()

    $.post ("/votes"),
      {id: $(@).parents("li").data("id")}

  getVoteCount = () ->
    $.get ("/votes"), (data) ->
      # console.log data
      for comment in data
        $("li[data-id=#{comment.id}]").children().children(".score").text(comment.votes)
        # console.log "#{comment.type}, #{comment.id}, #{comment.votes}"

  setInterval getVoteCount, 5000
