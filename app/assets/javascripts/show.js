$(document).on('turbolinks:load', function() {
	// console.log($('#shops'))
  return $('#shops').infiniteScroll({
    path: "nav.pagination a[rel=next]",
    // 次ページへのリンク指定。kaminariのnextを今回は指定。
    append: ".shop",
    // 動的に要素を追加する
    history: false,
    // 読むたびにURLを書き換える
    prefill: true,
    // スクロール仕切らないうちから読み込む。
    // falseにすると下までスクロールしてから読み込む。
    status: '.page-load-status'
    // 読み込み中もしくは読んだ後に表示する項目
  });
});