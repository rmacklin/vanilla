import $ from 'jquery'

const ImagesIndexView = {
  init() {
    const es6 = 'ES2015';
    $('#page_content').prepend(`<p>Hello from ${es6}</p>`);
  }
}

export default ImagesIndexView;
