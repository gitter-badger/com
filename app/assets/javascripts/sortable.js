(function() {
  var ui = {
    doingThings: function() {
      $('body').addClass('loading');
    },
    doneWithThings: function() {
      $('body').removeClass('loading');
    }
  };

  var request = function(url, data) {
    ui.doingThings();
    $.ajax({
      url: url,
      method: 'PUT',
      data: JSON.stringify(data),
      dataType: 'json',
      contentType: 'application/json',
      accepts: 'application/json',
      complete: function(_response, _textStatus) {
        ui.doneWithThings();
      }
    });
  };

  var updateOrderOfRequirements = function(deliverableUl) {
    var missionUl = $(deliverableUl).parent().parent();

    var requirements = Array.prototype.reduce.call(deliverableUl.children, function(previousValue, currentValue) {
      return previousValue.concat({ id: $(currentValue).data('id') });
    }, []);
    if (requirements.length == 0) return;

    var missionId = missionUl.data('id');
    var deliverableId = $(deliverableUl).data("id");

    var url = `/missions/${missionId}/deliverables/${deliverableId}/order_requirements`;
    var data = { requirements: requirements }
    request(url, data);
  };

  var updateOrderOfDeliverables = function(missionUl) {
    var missionId = $(missionUl).data('id');
    var deliverables = Array.prototype.reduce.call(missionUl.children, function(previousValue, currentValue) {
      return previousValue.concat({ id: currentValue.dataset.id })
    }, [])

    var url = `/missions/${missionId}/order_deliverables`;
    var data = { deliverables: deliverables };
    request(url, data);
  };

  $(document).ready(function() {
    $('ul#deliverables').sortable({
      handle: '.deliverable_handle',
      axis: 'y',
      start: function(event, ui) {
        $(event.target).addClass("active");
      },
      stop: function(event, ui) {
        $(event.target).removeClass("active");
      },
      update: function(event, ui) {
        updateOrderOfDeliverables(event.target);
      }
    });

    $('ul.requirements').sortable({
      handle: '.requirement_handle',
      axis: 'y',
      connectWith: '.requirements',
      update: function(event, ui) {
        updateOrderOfRequirements(event.target);
      }
    });
  });
})();
