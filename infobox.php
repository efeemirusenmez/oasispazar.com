<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bilgilendirme Butonu</title>
    <style>
        #infoBox {
            display: none;
            border: 1px solid #000;
            padding: 10px;
            margin-top: 10px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <button id="infoButton">Çekiliş bilgilendrimesi</button>
    <div id="infoBox">
        <p>Çekiliş mekanizması şu şekilde çalışır:</p>
        <ol>
            <li>İlk olarak, "Bilgilerinizi Girin" kısmına tıklayarak bilgilerinizi girin.</li>
            <li>Çekiliş ID'sini girin ve "Oluştur" butonuna basın.</li>
            <li>Oluşturduktan sonra, çekilişe katılmak isteyen kullanıcıların ID'lerini girin. Kendi ID'nizi de dahil etmeyi unutmayın; aksi halde çekilişe kaydolamazsınız.</li>
            <li>Tüm kullanıcıları ekledikten sonra "Çekilişi Bitir" butonuna basın.</li>
            <li>Çekiliş bittikten sonra, "Çekilişlerim" kısmından kime hediye alacağınızı görebilirsiniz.</li>
            <li>"Çekilişlerim" kısmında gördüğünüz bilgileri kullanarak, "Sepetim" kısmına eklenen tüm ürünler için alacağınız kişinin bilgilerini doldurun.</li>
            <li>Kart bilgilerinizi girdikten sonra siparişi tamamlayarak hediyeyi göndermek istediğiniz kişinin adresine yollayabilirsiniz.</li>
        </ol>
    </div>

    <script>
        document.getElementById("infoButton").addEventListener("click", function() {
            var infoBox = document.getElementById("infoBox");
            if (infoBox.style.display === "none" || infoBox.style.display === "") {
                infoBox.style.display = "block";
            } else {
                infoBox.style.display = "none";
            }
        });
    </script>
</body>
</html>
