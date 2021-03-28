class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end
    # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
    # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
    # デフォルトをnameに変更したためemailを許可している。


end

# deviseでstrong parametersを利用するためのコードを、app/controllersフォルダのapplication_controller.rbファイルに追加します。
# deviseのコントローラは、ライブラリで用意されているので、直接修正できません。
# このため、deviseのコントローラに修正が必要なときは、application_controllerに記述します。
# 今回は、初期設定では用意されていないカラム（name）をusersテーブルに追加しているので、これを追記します。

# これは、CARAVAN作成時のStrong Parametersと同様の機能です。
# privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。

