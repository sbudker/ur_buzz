/*Infinite scrolling with ajax script
 *checks for pagination element and listens to the scroll event
 *gets the link for the next page from the a .next class in .pagination
 */
jQuery ->
  if $('.pagination a').length
    $(window).scroll ->
    	if $('.pagination .next a').attr('href') != "#"
     		url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text('Loading...')
        $.getScript(url)
    $(window).scroll()