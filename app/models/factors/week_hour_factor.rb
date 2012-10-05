module Factors
  class WeekHourFactor < ForensicBase
    def score
      risk * scale
    end
    
    def weight
      3
    end
    
    def name
      "Week Hour: #{get_hour}h"
    end
    
    def why
      'The time of the week you are travelling has an impact on your risk of crashing.'
    end
    
    def source
      'http://www-fars.nhtsa.dot.gov/Crashes/CrashesTime.aspx'
    end
    
  private
    def get_hour
      return @seatbelt if @seatbelt
      uri = URI(method_url('get_trip_start_week_hour'))
      @seatbelt = Net::HTTP.get(uri).to_i
    end
  
    def scale
      100.0 / 981.0
    end
    
    def risk
      case get_hour.to_i
      when 0..3 then 981
      when 3..6 then 622
      when 6..9 then 324
      when 9..12 then 347
      when 12..15 then 549
      when 15..18 then 686
      when 18..21 then 717
      when 21..24 then 517
      when 24..27 then 322
      when 27..30 then 260
      when 30..33 then 423
      when 33..36 then 442
      when 36..39 then 552
      when 39..42 then 683
      when 42..45 then 652
      when 45..48 then 430
      when 48..51 then 262
      when 51..54 then 209
      when 54..57 then 464
      when 57..60 then 409
      when 60..63 then 493
      when 63..66 then 615
      when 66..69 then 596
      when 69..72 then 471
      when 72..75 then 310
      when 75..78 then 254
      when 78..81 then 430
      when 81..84 then 412
      when 84..87 then 508
      when 87..90 then 649
      when 90..93 then 606
      when 93..96 then 516
      when 96..99 then 396
      when 99..102 then 271
      when 102..105 then 430
      when 105..108 then 450
      when 108..111 then 528
      when 111..114 then 680
      when 114..117 then 633
      when 117..120 then 549
      when 120..123 then 543
      when 123..126 then 349
      when 126..129 then 444
      when 129..132 then 449
      when 132..135 then 680
      when 135..138 then 783
      when 138..141 then 804
      when 141..144 then 818
      when 144..147 then 955
      when 147..150 then 552
      when 150..153 then 431
      when 153..156 then 457
      when 156..159 then 635
      when 159..162 then 771
      when 162..165 then 798
      when 165..168 then 851
      end
    end
  end
end