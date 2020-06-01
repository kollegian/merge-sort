arr=[]
test_file=File.open("test.txt", "r")
test_file.readlines.each {|a| arr.push(a.to_i)}

def divide(arr)
  if arr.length==1
    return arr
  end
  n=arr.length
  arrl=arr.slice(0, n/2)
  arrr=arr.slice(n/2, arr.length)
  return merge(divide(arrl), divide(arrr))
end

def merge(arrL, arrR)
  arr_res=[]
  tot_len=arrL.length+arrR.length
  m_counter=0
  l_counter=0
  r_counter=0
  while(m_counter<tot_len)
    if arrL[l_counter]<arrR[r_counter]
      arr_res[m_counter]=arrL[l_counter]
      m_counter+=1
      l_counter+=1
      if arrL[l_counter]==nil
        while (m_counter<tot_len)
          arr_res[m_counter]=arrR[r_counter]
          m_counter+=1
          r_counter+=1
        end
      end        
    else
      arr_res[m_counter]=arrR[r_counter]
      m_counter+=1
      r_counter+=1
      if arrR[r_counter]==nil
        while (m_counter<tot_len)
          arr_res[m_counter]=arrL[l_counter]
          m_counter+=1
          l_counter+=1
        end
      end            
    end
   end
   return arr_res
end  




 
