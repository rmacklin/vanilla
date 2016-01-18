import $ from 'jquery';

const ShareImageModal = {
  init() {
    const $modal = $('#share_image_modal')
        , UNPROCESSABLE_ENTITY = 422;

    const successAlert = `
      <div class="alert alert-success alert-dismissible fade in" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        Rock on! We shared the image.
      </div>`;

    $modal.on('show.bs.modal', (event) => {
      const $form = $modal.find('form')
          , $triggeringImage = $(event.relatedTarget).closest('[data-image-id]')
          , imageId = $triggeringImage.data('image-id')
          , formAction = $form.data('url-template').replace('ID_PLACEHOLDER', imageId);

      $form.attr('action', formAction);
    });

    $modal.on('ajax:success', () => {
      $modal.modal('hide');
      $('#page_content').prepend(successAlert);
    });

    $modal.on('ajax:error', (event, xhr) => {
      if (xhr.status === UNPROCESSABLE_ENTITY) {
        $modal.find('form').replaceWith(xhr.responseJSON.form_html);
      } else {
        alert("We're sorry, but something went wrong. Please try again.");
      }
    });
  }
};

export default ShareImageModal;
