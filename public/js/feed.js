function like(id, type='POST') {
    let likesCount = 0
    let el = ''

    if(type == 'POST') {
        el = document.getElementById('post-btn-' + id)
        likesCount = document.getElementById('post-likescount-' + id)
    }else{
        el = document.getElementById('comment-btn-' + id)
        likesCount = document.getElementById('comment-likescount-' + id)
    }
    fetch('/like/' + type + '/' + id)
        .then(response => response.json())
        .then(data => {
            let currentCount = 0
            if (data.status == 'LIKE') {
                currentCount = parseInt(likesCount.innerHTML) + 1
                el.innerText = 'UNLIKE'
            } else {
                currentCount = parseInt(likesCount.innerHTML) - 1
                el.innerText = 'LIKE'
            }
            likesCount.innerHTML = currentCount
        });
}