require 'squib'
require 'yaml'

copywright = "CC~BY-SA~3.0~FR Albiez, version: v1"

Dir["data/*.yml"].each do |data|
  lang = File.basename(data, '.yml')
  tasks = YAML.load_file(data)

  Squib::Deck.new(cards: tasks.size, layout: ['layout/card.yml', 'layout/tasks.yml']) do
    background color: 'white'

    rect layout: 'safe', fill_color: tasks.map {|i| i['color'] }
    rect layout: 'inside', fill_color: '#ffffff80'

    text str: tasks.map {|i| i['title'] }, layout: 'title'
    circle layout: 'art_section', fill_color: 'lightgray'
    text str: tasks.map {|i| i['cost'] }, layout: 'art'
    #svg file: tasks.map {|i| i['icon'] }, layout: 'art'

    rect layout: 'description_section', fill_color: '#ffffff80'
    text str: tasks.map {|i| i['description'] }, layout: 'description'

    #rect layout: 'ok_section', fill_color: 'ok_color'
    #svg file: 'happy-1.svg', layout: 'ok_icon'
    #text str: tasks.map {|i| i['ok'] }, layout: 'ok_text'

    #rect layout: 'ko_section', fill_color: 'ko_color'
    #svg file: 'angry.svg', layout: 'ko_icon'
    #text str: tasks.map {|i| i['ko'] }, layout: 'ko_text'

    text str: copywright, layout: 'copyright'

    save format: :pdf, file: "tasks-#{lang}.pdf", width: "29.7cm", height: "21cm", trim: 40, gap: 0
  end
end
