jQuery ->
  if $('.pagination a').length
    $(window).scroll ->
    	if $('.pagination .next a').attr('href') != "#"
     		url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
        $('.pagination').text('Loading...')
        $.getScript(url)
    $(window).scroll()