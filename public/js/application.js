$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $(".voting-buttons").on("click", "a.upvote-button", function(event){
		event.preventDefault();

		var questionId = $(this).attr('id');
		var button = $(this);

		$.ajax({
			type: 'GET',
			url: '/questions/'+questionId+'/upvote',
			dataType: 'JSON'
		})
		.done(function(response){
			// console.log($(".num-of-votes"))
			// console.log($(button).parent().closest('p.num-of-votes'));
			$(".num-of-votes").text(response.count);
		});
  });


  // $(".voting-buttons-for-answers").on("click", "a.upvote-button", function(event){
		// event.preventDefault();

		// var answerId = $(this).attr('id');
		// var button = $(this);

		// $.ajax({
		// 	type: 'GET',
		// 	url: '/answers/'+answerId+'/upvote',
		// 	dataType: 'JSON'
		// })
		// .done(function(response){
		// 	// console.log($(".num-of-votes"))
		// 	// console.log($(button).parent().closest('p.num-of-votes'));
		// 	$(".num-of-votes").text(response.count);
		// });
  // });
});
