# his.radiko
<p align="center">
	<img src="./rec_radio.jpg" width="50%" />
</p>
recording Radiko/Radiru-radiru on ubuntu/Raspberry-pi

## 概要
インターネットでストリーム配信されている<a href="http://radiko.jp/>ラジコ</a>と
  <a href="https://www.nhk.or.jp/radio/">らじるらじる</a>を録音する小さなスクリプトです。
  ラジコ用: <a href="./rec_radiko.sh">rec_radiko_sh</a>
  らじるらじる用: <a href="./rec_nhk.sh">rec_nhk_sh</a>
  
## 注意事項
録音したデータの取り扱いは、私的使用(著作権法第30条に定めるもの)の範囲内で、
かつ「ユーザー本人による」個人的な視聴の目的に限ること。

## 参考にさせていただいた情報
<ul>
  <li>https://tech.matchy.net/archives/152</li>
  <li>https://gist.github.com/matchy2/3956266</li>
  <li>https://tech.matchy.net/archives/241</li>
  <li>https://gist.github.com/matchy2/9515cecbea40918add594203dc61406c</li>
</ul>

## 何が違うの？
ほぼ同じです(^^;
録音データ形式を若干変えているだけです。

##使い方
cronで定時起動させて録音させます。
<a href="./crontab-l.sample>サンプルのcrontab</a>を参照ください。

以下、書きかけです。
