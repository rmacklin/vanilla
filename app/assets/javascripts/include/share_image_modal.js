import $ from 'jquery';

const ShareImageModal = {
  init() {
    $('#share_image_modal').on('show.bs.modal', function(event) {
      const $modal = $(this)
          , $form = $modal.find('form')
          , $triggeringImage = $(event.relatedTarget).closest('[data-image-id]')
          , imageId = $triggeringImage.data('image-id')
          , formAction = $form.data('url-template').replace('ID_PLACEHOLDER', imageId);

      $form.attr('action', formAction);
    });
  }
};

export default ShareImageModal;
