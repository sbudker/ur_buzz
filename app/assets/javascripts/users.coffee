jQuery ->
  if $('.pagination a').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 1000
        $('.pagination').text('Loading...')
        $.getScript(url)
    $(window).scroll()