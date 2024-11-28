module ApplicationHelper
  def default_meta_tags
    {
      site: 'Smart Phone Choice',
      title: 'スマホの購入における情報収集から購入までサポート',
      reverse: true,
      charset: 'utf-8',
      description: 'もう騙されない。損しない。賢いスマホの買い方・料金プランの選び方をサポート。みんなの声を参考に、あなただけの最適なプランを見つけよう',
      keywords: 'スマホ,通信キャリア,格安SIM,サブブランド,乗り換え,SIMのみ,共有,みんなで,賢く',
      canonical: 'https://smart-phone-choice.com/',
      separator: '|',
      og:{
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: 'https://smart-phone-choice.com/',
        image: image_url('app_logo.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary',
        site: '@emieminosuke',
        image: image_url('app_logo.png'),
        title: 'Smart Phone Choiceでスマホ選び #すまちょい',
        description: 'もう騙されない。損しない。賢いスマホの買い方・料金プランの選び方をサポート。'
      }
    }
  end
end
