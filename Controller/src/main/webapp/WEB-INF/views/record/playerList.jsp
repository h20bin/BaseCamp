<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid px-0">

    <h4 class="fw-bold mt-4 mb-3 text-primary">⚾ 타자 기록 (Batters)</h4>
    <div class="table-responsive mb-5">
        <table class="table table-hover text-center align-middle shadow-sm" style="font-size: 0.9rem;">
            <thead class="table-light">
                <tr>
                    <th class="py-3">선수명</th>
                    <th>팀</th>
                    <th>포지션</th>
                    <th class="text-danger">타율 (AVG)</th>
                    <th>홈런 (HR)</th>
                    <th>득점 (R)</th>
                    <th>타점 (RBI)</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>전준우</td><td>롯데 자이언츠</td><td>지명타자</td><td>0.293</td><td>8</td><td>50</td><td>70</td></tr>
                <tr><td>구자욱</td><td>삼성 라이온즈</td><td>좌익수</td><td>0.319</td><td>19</td><td>106</td><td>96</td></tr>
                <tr><td>김현수</td><td>LG 트윈스</td><td>좌익수</td><td>0.298</td><td>12</td><td>66</td><td>90</td></tr>
                <tr><td>최항</td><td>롯데 자이언츠</td><td>1루수</td><td>0.167</td><td>0</td><td>1</td><td>1</td></tr>
                <tr><td>고승민</td><td>롯데 자이언츠</td><td>2루수</td><td>0.271</td><td>4</td><td>71</td><td>45</td></tr>
                <tr><td>전민재</td><td>롯데 자이언츠</td><td>유격수</td><td>0.287</td><td>5</td><td>39</td><td>34</td></tr>
                <tr><td>손호영</td><td>롯데 자이언츠</td><td>3루수</td><td>0.250</td><td>4</td><td>39</td><td>41</td></tr>
                <tr><td>윤동희</td><td>롯데 자이언츠</td><td>우익수</td><td>0.282</td><td>9</td><td>54</td><td>53</td></tr>
                <tr><td>레이예스</td><td>롯데 자이언츠</td><td>좌익수</td><td>0.326</td><td>13</td><td>75</td><td>107</td></tr>
                <tr><td>황성빈</td><td>롯데 자이언츠</td><td>중견수</td><td>0.256</td><td>1</td><td>43</td><td>22</td></tr>
                <tr><td>유강남</td><td>롯데 자이언츠</td><td>포수</td><td>0.274</td><td>5</td><td>35</td><td>38</td></tr>

                <tr><td>디아즈</td><td>삼성 라이온즈</td><td>1루수</td><td>0.314</td><td>50</td><td>93</td><td>158</td></tr>
                <tr><td>양도근</td><td>삼성 라이온즈</td><td>2루수</td><td>0.259</td><td>0</td><td>23</td><td>16</td></tr>
                <tr><td>이재현</td><td>삼성 라이온즈</td><td>유격수</td><td>0.254</td><td>16</td><td>82</td><td>67</td></tr>
                <tr><td>김영웅</td><td>삼성 라이온즈</td><td>3루수</td><td>0.249</td><td>22</td><td>66</td><td>72</td></tr>
                <tr><td>김성윤</td><td>삼성 라이온즈</td><td>우익수</td><td>0.331</td><td>0</td><td>15</td><td>6</td></tr>
                <tr><td>김지찬</td><td>삼성 라이온즈</td><td>중견수</td><td>0.281</td><td>3</td><td>59</td><td>36</td></tr>
                <tr><td>강민호</td><td>삼성 라이온즈</td><td>포수</td><td>0.269</td><td>12</td><td>37</td><td>71</td></tr>
                <tr><td>박병호</td><td>삼성 라이온즈</td><td>지명타자</td><td>0.199</td><td>15</td><td>26</td><td>33</td></tr>

                <tr><td>오스틴</td><td>LG 트윈스</td><td>1루수</td><td>0.313</td><td>31</td><td>82</td><td>95</td></tr>
                <tr><td>신민재</td><td>LG 트윈스</td><td>2루수</td><td>0.313</td><td>1</td><td>87</td><td>61</td></tr>
                <tr><td>오지환</td><td>LG 트윈스</td><td>유격수</td><td>0.253</td><td>16</td><td>57</td><td>62</td></tr>
                <tr><td>구본혁</td><td>LG 트윈스</td><td>3루수</td><td>0.286</td><td>1</td><td>41</td><td>38</td></tr>
                <tr><td>문성주</td><td>LG 트윈스</td><td>우익수</td><td>0.305</td><td>3</td><td>57</td><td>70</td></tr>
                <tr><td>박해민</td><td>LG 트윈스</td><td>중견수</td><td>0.276</td><td>3</td><td>80</td><td>43</td></tr>
                <tr><td>박동원</td><td>LG 트윈스</td><td>포수</td><td>0.253</td><td>22</td><td>57</td><td>76</td></tr>
                <tr><td>문보경</td><td>LG 트윈스</td><td>지명타자</td><td>0.276</td><td>24</td><td>91</td><td>108</td></tr>

                <tr><td>고명준</td><td>SSG 랜더스</td><td>1루수</td><td>0.278</td><td>17</td><td>46</td><td>64</td></tr>
                <tr><td>정준재</td><td>SSG 랜더스</td><td>2루수</td><td>0.245</td><td>0</td><td>58</td><td>25</td></tr>
                <tr><td>박성한</td><td>SSG 랜더스</td><td>유격수</td><td>0.274</td><td>7</td><td>73</td><td>48</td></tr>
                <tr><td>안상현</td><td>SSG 랜더스</td><td>3루수</td><td>0.264</td><td>6</td><td>38</td><td>15</td></tr>
                <tr><td>한유섬</td><td>SSG 랜더스</td><td>우익수</td><td>0.278</td><td>15</td><td>50</td><td>71</td></tr>
                <tr><td>최지훈</td><td>SSG 랜더스</td><td>중견수</td><td>0.284</td><td>7</td><td>66</td><td>45</td></tr>
                <tr><td>에레디아</td><td>SSG 랜더스</td><td>좌익수</td><td>0.339</td><td>13</td><td>46</td><td>54</td></tr>
                <tr><td>조형우</td><td>SSG 랜더스</td><td>포수</td><td>0.238</td><td>4</td><td>23</td><td>29</td></tr>
                <tr><td>최정</td><td>SSG 랜더스</td><td>지명타자</td><td>0.244</td><td>23</td><td>54</td><td>63</td></tr>

                <tr><td>최주환</td><td>키움 히어로즈</td><td>1루수</td><td>0.275</td><td>12</td><td>45</td><td>74</td></tr>
                <tr><td>김태진</td><td>키움 히어로즈</td><td>2루수</td><td>0.233</td><td>0</td><td>27</td><td>25</td></tr>
                <tr><td>어준서</td><td>키움 히어로즈</td><td>유격수</td><td>0.238</td><td>6</td><td>48</td><td>27</td></tr>
                <tr><td>송성문</td><td>키움 히어로즈</td><td>3루수</td><td>0.315</td><td>26</td><td>103</td><td>90</td></tr>
                <tr><td>카디네스</td><td>키움 히어로즈</td><td>우익수</td><td>0.253</td><td>7</td><td>33</td><td>42</td></tr>
                <tr><td>이주형</td><td>키움 히어로즈</td><td>중견수</td><td>0.240</td><td>11</td><td>55</td><td>45</td></tr>
                <tr><td>임지열</td><td>키움 히어로즈</td><td>좌익수</td><td>0.244</td><td>11</td><td>51</td><td>50</td></tr>
                <tr><td>김건희</td><td>키움 히어로즈</td><td>포수</td><td>0.242</td><td>3</td><td>24</td><td>25</td></tr>
                <tr><td>이원석</td><td>키움 히어로즈</td><td>지명타자</td><td>0.143</td><td>0</td><td>1</td><td>0</td></tr>

                <tr><td>채은성</td><td>한화 이글스</td><td>1루수</td><td>0.288</td><td>19</td><td>54</td><td>88</td></tr>
                <tr><td>이도윤</td><td>한화 이글스</td><td>2루수</td><td>0.260</td><td>1</td><td>37</td><td>36</td></tr>
                <tr><td>심우준</td><td>한화 이글스</td><td>유격수</td><td>0.231</td><td>2</td><td>39</td><td>22</td></tr>
                <tr><td>노시환</td><td>한화 이글스</td><td>3루수</td><td>0.260</td><td>32</td><td>97</td><td>101</td></tr>
                <tr><td>이진영</td><td>한화 이글스</td><td>우익수</td><td>0.274</td><td>11</td><td>49</td><td>43</td></tr>
                <tr><td>플로리얼</td><td>한화 이글스</td><td>중견수</td><td>0.271</td><td>8</td><td>36</td><td>29</td></tr>
                <tr><td>문현빈</td><td>한화 이글스</td><td>좌익수</td><td>0.320</td><td>12</td><td>71</td><td>80</td></tr>
                <tr><td>최재훈</td><td>한화 이글스</td><td>포수</td><td>0.286</td><td>1</td><td>17</td><td>35</td></tr>
                <tr><td>최인호</td><td>한화 이글스</td><td>지명타자</td><td>0.259</td><td>2</td><td>7</td><td>19</td></tr>

                <tr><td>오선우</td><td>KIA 타이거즈</td><td>1루수</td><td>0.265</td><td>18</td><td>58</td><td>56</td></tr>
                <tr><td>김선빈</td><td>KIA 타이거즈</td><td>2루수</td><td>0.321</td><td>3</td><td>31</td><td>46</td></tr>
                <tr><td>박찬호</td><td>KIA 타이거즈</td><td>유격수</td><td>0.287</td><td>5</td><td>75</td><td>42</td></tr>
                <tr><td>위즈덤</td><td>KIA 타이거즈</td><td>3루수</td><td>0.236</td><td>35</td><td>73</td><td>85</td></tr>
                <tr><td>나성범</td><td>KIA 타이거즈</td><td>우익수</td><td>0.268</td><td>10</td><td>30</td><td>36</td></tr>
                <tr><td>김호령</td><td>KIA 타이거즈</td><td>중견수</td><td>0.283</td><td>6</td><td>46</td><td>39</td></tr>
                <tr><td>박정우</td><td>KIA 타이거즈</td><td>좌익수</td><td>0.274</td><td>0</td><td>17</td><td>4</td></tr>
                <tr><td>김태군</td><td>KIA 타이거즈</td><td>포수</td><td>0.258</td><td>5</td><td>20</td><td>31</td></tr>
                <tr><td>최형우</td><td>KIA 타이거즈</td><td>지명타자</td><td>0.307</td><td>24</td><td>74</td><td>86</td></tr>

                <tr><td>강승호</td><td>두산 베어스</td><td>1루수</td><td>0.236</td><td>8</td><td>51</td><td>37</td></tr>
                <tr><td>오명진</td><td>두산 베어스</td><td>2루수</td><td>0.263</td><td>4</td><td>38</td><td>41</td></tr>
                <tr><td>안재석</td><td>두산 베어스</td><td>유격수</td><td>0.319</td><td>4</td><td>25</td><td>20</td></tr>
                <tr><td>박준순</td><td>두산 베어스</td><td>3루수</td><td>0.284</td><td>4</td><td>34</td><td>19</td></tr>
                <tr><td>케이브</td><td>두산 베어스</td><td>우익수</td><td>0.299</td><td>16</td><td>72</td><td>87</td></tr>
                <tr><td>정수빈</td><td>두산 베어스</td><td>중견수</td><td>0.258</td><td>6</td><td>89</td><td>38</td></tr>
                <tr><td>조수행</td><td>두산 베어스</td><td>좌익수</td><td>0.244</td><td>0</td><td>30</td><td>9</td></tr>
                <tr><td>양의지</td><td>두산 베어스</td><td>포수</td><td>0.337</td><td>20</td><td>56</td><td>89</td></tr>
                <tr><td>김재환</td><td>두산 베어스</td><td>지명타자</td><td>0.241</td><td>13</td><td>42</td><td>50</td></tr>

                <tr><td>데이비슨</td><td>NC 다이노스</td><td>1루수</td><td>0.293</td><td>3</td><td>63</td><td>97</td></tr>
                <tr><td>박민우</td><td>NC 다이노스</td><td>2루수</td><td>0.302</td><td>3</td><td>64</td><td>67</td></tr>
                <tr><td>김주원</td><td>NC 다이노스</td><td>유격수</td><td>0.289</td><td>15</td><td>98</td><td>65</td></tr>
                <tr><td>김휘집</td><td>NC 다이노스</td><td>3루수</td><td>0.249</td><td>17</td><td>64</td><td>56</td></tr>
                <tr><td>박건우</td><td>NC 다이노스</td><td>우익수</td><td>0.289</td><td>9</td><td>43</td><td>67</td></tr>
                <tr><td>천재환</td><td>NC 다이노스</td><td>중견수</td><td>0.238</td><td>6</td><td>47</td><td>31</td></tr>
                <tr><td>권희동</td><td>NC 다이노스</td><td>좌익수</td><td>0.246</td><td>6</td><td>56</td><td>39</td></tr>
                <tr><td>김형준</td><td>NC 다이노스</td><td>포수</td><td>0.232</td><td>18</td><td>51</td><td>55</td></tr>
                <tr><td>손아섭</td><td>NC 다이노스</td><td>지명타자</td><td>0.300</td><td>0</td><td>21</td><td>33</td></tr>

                <tr><td>황재균</td><td>KT 위즈</td><td>1루수</td><td>0.275</td><td>7</td><td>50</td><td>48</td></tr>
                <tr><td>김상수</td><td>KT 위즈</td><td>2루수</td><td>0.254</td><td>5</td><td>42</td><td>47</td></tr>
                <tr><td>권동진</td><td>KT 위즈</td><td>유격수</td><td>0.225</td><td>1</td><td>34</td><td>25</td></tr>
                <tr><td>허경민</td><td>KT 위즈</td><td>3루수</td><td>0.283</td><td>4</td><td>47</td><td>44</td></tr>
                <tr><td>안현민</td><td>KT 위즈</td><td>우익수</td><td>0.334</td><td>22</td><td>72</td><td>80</td></tr>
                <tr><td>배정대</td><td>KT 위즈</td><td>중견수</td><td>0.204</td><td>2</td><td>25</td><td>28</td></tr>
                <tr><td>장진혁</td><td>KT 위즈</td><td>좌익수</td><td>0.209</td><td>4</td><td>19</td><td>19</td></tr>
                <tr><td>장성우</td><td>KT 위즈</td><td>포수</td><td>0.247</td><td>14</td><td>44</td><td>58</td></tr>
                <tr><td>강백호</td><td>KT 위즈</td><td>지명타자</td><td>0.265</td><td>15</td><td>41</td><td>61</td></tr>
            </tbody>
        </table>
    </div>


    <h4 class="fw-bold mt-5 mb-3 text-primary">⚾ 투수 기록 (Pitchers)</h4>
    <div class="table-responsive mb-5">
        <table class="table table-hover text-center align-middle shadow-sm" style="font-size: 0.9rem;">
            <thead class="table-light">
                <tr>
                    <th class="py-3">선수명</th>
                    <th>팀</th>
                    <th class="text-primary">승 (W)</th>
                    <th>패 (L)</th>
                    <th>삼진 (SO)</th>
                    <th>이닝 (IP)</th>
                    <th class="text-danger">평균자책점 (ERA)</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>박세웅</td><td>롯데 자이언츠</td><td>11</td><td>13</td><td>156</td><td>160.2</td><td>4.93</td></tr>
                <tr><td>원태인</td><td>삼성 라이온즈</td><td>12</td><td>4</td><td>108</td><td>166.2</td><td>3.24</td></tr>
                <tr><td>임찬규</td><td>LG 트윈스</td><td>11</td><td>7</td><td>107</td><td>160.1</td><td>3.03</td></tr>

                <tr><td>정철원</td><td>롯데 자이언츠</td><td>8</td><td>3</td><td>55</td><td>70.0</td><td>4.24</td></tr>
                <tr><td>김원중</td><td>롯데 자이언츠</td><td>4</td><td>3</td><td>69</td><td>60.2</td><td>2.67</td></tr>

                <tr><td>김재윤</td><td>삼성 라이온즈</td><td>4</td><td>7</td><td>43</td><td>57.2</td><td>4.99</td></tr>
                <tr><td>이호성</td><td>삼성 라이온즈</td><td>7</td><td>4</td><td>69</td><td>55.1</td><td>6.34</td></tr>

                <tr><td>김진성</td><td>LG 트윈스</td><td>6</td><td>4</td><td>63</td><td>70.2</td><td>3.44</td></tr>
                <tr><td>장현식</td><td>LG 트윈스</td><td>3</td><td>3</td><td>38</td><td>49.2</td><td>4.35</td></tr>

                <tr><td>김광현</td><td>SSG 랜더스</td><td>10</td><td>10</td><td>138</td><td>144.0</td><td>5.00</td></tr>
                <tr><td>조병현</td><td>SSG 랜더스</td><td>9</td><td>10</td><td>79</td><td>67.1</td><td>1.60</td></tr>
                <tr><td>노경은</td><td>SSG 랜더스</td><td>3</td><td>6</td><td>68</td><td>80.0</td><td>2.14</td></tr>

                <tr><td>김윤하</td><td>키움 히어로즈</td><td>1</td><td>6</td><td>52</td><td>88.0</td><td>6.14</td></tr>
                <tr><td>김선기</td><td>키움 히어로즈</td><td>1</td><td>7</td><td>43</td><td>78.0</td><td>5.65</td></tr>
                <tr><td>주승우</td><td>키움 히어로즈</td><td>6</td><td>9</td><td>35</td><td>44.0</td><td>2.45</td></tr>

                <tr><td>류현진</td><td>한화 이글스</td><td>9</td><td>7</td><td>122</td><td>139.1</td><td>3.23</td></tr>
                <tr><td>김서현</td><td>한화 이글스</td><td>2</td><td>4</td><td>71</td><td>66.0</td><td>3.14</td></tr>
                <tr><td>박상원</td><td>한화 이글스</td><td>4</td><td>3</td><td>52</td><td>66.2</td><td>4.19</td></tr>

                <tr><td>양현종</td><td>KIA 타이거즈</td><td>7</td><td>9</td><td>109</td><td>153.0</td><td>5.06</td></tr>
                <tr><td>전상현</td><td>KIA 타이거즈</td><td>7</td><td>5</td><td>50</td><td>70.0</td><td>3.34</td></tr>
                <tr><td>정해영</td><td>KIA 타이거즈</td><td>3</td><td>7</td><td>72</td><td>61.2</td><td>3.79</td></tr>

                <tr><td>곽빈</td><td>두산 베어스</td><td>5</td><td>7</td><td>107</td><td>109.1</td><td>4.20</td></tr>
                <tr><td>김택연</td><td>두산 베어스</td><td>4</td><td>5</td><td>79</td><td>66.1</td><td>3.53</td></tr>
                <tr><td>이영하</td><td>두산 베어스</td><td>4</td><td>4</td><td>72</td><td>66.2</td><td>4.05</td></tr>

                <tr><td>신민혁</td><td>NC 다이노스</td><td>6</td><td>3</td><td>84</td><td>132.0</td><td>4.77</td></tr>
                <tr><td>전사민</td><td>NC 다이노스</td><td>7</td><td>7</td><td>62</td><td>82.1</td><td>4.26</td></tr>
                <tr><td>류진욱</td><td>NC 다이노스</td><td>4</td><td>3</td><td>57</td><td>66.0</td><td>3.27</td></tr>

                <tr><td>고영표</td><td>KT 위즈</td><td>11</td><td>8</td><td>154</td><td>161.0</td><td>3.30</td></tr>
                <tr><td>박영현</td><td>KT 위즈</td><td>5</td><td>6</td><td>77</td><td>69.0</td><td>3.39</td></tr>
                <tr><td>원상현</td><td>KT 위즈</td><td>0</td><td>3</td><td>45</td><td>57.0</td><td>5.21</td></tr>
            </tbody>
        </table>
    </div>

</div>