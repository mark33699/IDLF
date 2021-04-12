import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Locale资源类
class L10N {
  L10N(this.isZh);
  //是否为中文
  bool isZh = false;

  //为了使用方便，我们定义一个静态方法
  static L10N of(BuildContext context) {
    return Localizations.of<L10N>(context, L10N);
  }

  //Locale相关值
  String get appTitle {
    return isZh ? "iOS工程師學Flutter " : "iOS Developer Learning Flutter";
  }
  String get l10nTitle {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

//Locale代理类
class L10NDelegate extends LocalizationsDelegate<L10N> {
  const L10NDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<L10N> load(Locale locale) {
    print("$locale");
    return SynchronousFuture<L10N>(
        L10N(locale.languageCode == "zh")
    );
  }

  //当Localizations组件重新build时，是否调用load方法重新加载Locale资源。
  //一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次在Localizations重新build时都加载，所以返回false即可。
  @override
  bool shouldReload(L10NDelegate old) => false;
}