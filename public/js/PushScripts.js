
<script type="text/javascript" src="https://js.pusher.com/3.1/pusher.min.js"></script>

<script type="text/javascript" data-id="<%= current_model.id =%>" id='toPushID' data-lang="{{ App::getLocale() }}">
    function zero() {
        var bell = document.getElementById('number');
        var text = bell.innerHTML;

        if(text != 0){
            bell.style.display = 'none';
            bell.innerHTML = 0;

                $.ajax({
                    type: 'GET',
                    url: '/watchNotification',
                    data:{},
                    success: function (response) {
                    },
                    error: function(error){
                        console.log(error);
                    }
                });
        }

    }

    // Enable pusher logging - don't include this in production
    // Pusher.logToConsole = true;

    var pusher = new Pusher('0f1b0bfe1501f60c1186', {
        cluster: "eu",
        encrypted: true,
    });

    var user = $('#toPushID').data('id');
    var lang = $('#toPushID').data('lang');

    // Subscribe to the channel we specified in our Laravel Event
    var channel = pusher.subscribe('council' + user);

    // Bind a function to a Event (the full Laravel class)
    channel.bind('App\\Events\\Councilcreated', function (data) {
        var currentDate = new Date();

        var date = currentDate.getDate();
        var month = currentDate.getMonth(); //Be careful! January is 0 not 1
        var year = currentDate.getFullYear();
        var hour = currentDate.getHours();
        var mintues = currentDate.getMinutes(); 
        var seconds = currentDate.getSeconds();
        var dateString = year + "-" + (month + 1) + "-" + date + " " + hour + ":" + mintues + ":" + seconds;
        var ul = document.getElementById("maxy");
        var li = document.createElement('div');
        li.className = 'item-content';

        var des = document.getElementById('number');
        des.removeAttribute("hidden");
        des.style.display = 'block';
        var not = parseInt(document.getElementById('number').innerHTML);
        des.innerHTML = not + 1;


        var a = document.createElement('a');
        a.setAttribute("style", "background-color: #e0e2e8;");
        a.setAttribute("id", "max" + data.d);

        a.setAttribute("href", data.page);

        a.setAttribute("value", data.d);
        a.className = 'dropdown-item';
        var p = document.createElement('p');
        var p2 = document.createElement('p');

        p.className = 'font-weight-light small-text mb-0 text-muted';
        p2.className = 'font-weight-light small-text mb-0 text-muted';
        p2.setAttribute("style", "font-size:0.8em;");

        var h = document.createElement('h6');
        h.className = 'font-weight-normal';

        var thum = document.createElement('div');
        thum.className = 'item-thumbnail';

        var item = document.createElement('div');
        item.className = 'item-icon '+data.color;

        var i = document.createElement('i');
        i.className = data.icon +' mx-0';

        item.appendChild(i);
        thum.appendChild(item);
        if(lang == 'ar'){
            p.appendChild(document.createTextNode(data.message_ar));
        }
        else if(lang == 'en'){
            p.appendChild(document.createTextNode(data.message));
        }
        p2.innerHTML = dateString;
        if(lang == 'ar'){
            h.appendChild(document.createTextNode(data.title_ar));
        }
        else if(lang == 'en'){
            h.appendChild(document.createTextNode(data.title));
        }
        li.appendChild(h);
        li.appendChild(p);
        li.appendChild(p2);
        a.appendChild(thum);
        a.appendChild(li);
        var notificationHeader = document.getElementById("notificationHeader");
        notificationHeader.parentNode.insertBefore(a, notificationHeader.nextSibling);

        var noNotification = document.getElementById("no-notification");
        if(noNotification != null){
            noNotification.remove();
        }

        $('#max'+ data.d).on('click', function () {
            $value = $(this).attr('value');
            $.ajax({
                type: 'get',
                url: '/updateseen',
                data: {
                    'seen': $value
                },
                success: function (data) {
                    $('nav').html(data);
                }
            });
        });

    });
</script>

<script type="text/javascript">
    $(function () {
        $('a[id^="max"]').on('click', function () {
            $value = $(this).attr('value');
            $.ajax({
                type: 'get',
                url: '/updateseen',
                data: {
                    'seen': $value
                },
                success: function (data) {
                    $('nav').html(data);
                }
            });
        });
    });

</script>
