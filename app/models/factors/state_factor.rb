module Factors
  class StateFactor < Base
    def score
      risk * scale
    end
    
    def weight
      1
    end
    
    def name
      "State: #{start_address_state}"
    end
    
    def why
      'Some states of America are more risky then others!'
    end
    
    def source
      'http://www-fars.nhtsa.dot.gov/States/StatesCrashesAndAllVictims.aspx'
    end
    
  private
    def scale
      100 / 0.000216021517226
    end
    
    def risk
      case start_address_state
      when 'AK' then 0.000078847586208
      when 'AL' then 0.000180344688493
      when 'AR' then 0.000193078131827
      when 'AZ' then 0.000119211197342
      when 'CA' then 0.000072878166281
      when 'CO' then 0.000089079844969
      when 'CT' then 0.000089253313494
      when 'DC' then 0.000039885462248
      when 'DE' then 0.000112480427292
      when 'FL' then 0.000130044129904
      when 'GA' then 0.000128410875162
      when 'HI' then 0.000083069849982
      when 'IA' then 0.000128021849062
      when 'ID' then 0.000133326358685
      when 'IL' then 0.000072248974174
      when 'IN' then 0.000116289794167
      when 'KS' then 0.000151062802169
      when 'KY' then 0.000175140752096
      when 'LA' then 0.000156616311214
      when 'MA' then 0.000047956290743
      when 'MD' then 0.000085389375553
      when 'ME' then 0.000121201992531
      when 'MI' then 0.000095309015707
      when 'MN' then 0.000077489783509
      when 'MO' then 0.000136752376511
      when 'MS' then 0.000216021517226
      when 'MT' then 0.000191021967526
      when 'NC' then 0.000138325452418
      when 'ND' then 0.000156112704452
      when 'NE' then 0.000104033146055
      when 'NH' then 0.000097229712793
      when 'NJ' then 0.000063240070911
      when 'NM' then 0.0001680281316
      when 'NV' then 0.00009516576432
      when 'NY' then 0.000061925569388
      when 'OH' then 0.000093615882246
      when 'OK' then 0.000178069180943
      when 'OR' then 0.000082744421016
      when 'PA' then 0.000104232443387
      when 'RI' then 0.000062703846881
      when 'SC' then 0.000175121352611
      when 'SD' then 0.000171952148174
      when 'TN' then 0.000162461856525
      when 'TX' then 0.000119225814847
      when 'UT' then 0.000085387054816
      when 'VA' then 0.000092488161515
      when 'VT' then 0.000113465475332
      when 'WA' then 0.000068108747959
      when 'WI' then 0.000100580518398
      when 'WV' then 0.000169995153789
      when 'WY' then 0.000275005056545
      end
    end
  end
end