$(function() {

  $( '#ri-grid' ).gridrotator( {
    rows    : 2,
    columns   : 12,
    preventClick  : true,
    animType  : 'fadeInOut',
    animSpeed : 1000,
    interval  : 600,
    step    : 1,
    w1024     : {
      rows  : 2,
      columns : 10
    },

    w768      : {
      rows  : 2,
      columns : 8 
    },

    w480      : {
      rows  : 2,
      columns : 6
    },

    w320      : {
      rows  : 2,
      columns : 4
    },

    w240      : {
      rows  : 2,
      columns : 4
    }
  } );

});
  

