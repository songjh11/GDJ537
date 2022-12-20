<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="card mb-3 unknownList">
        <c:forEach items="${unknownList }" var="unknown">
          <div class="card-header bg-white">
            <div class="row justify-content-between">
              <p style="
                                                      margin-bottom: 0;
                                                      line-height: 400%;
                                                      font-size: 20px;
                                                      font-weight: bold;
                                                      margin-left: 10px;
                                                  ">[익명]</p>
              <div class="col-auto align-self-center">
                <p style="
                                                        display: inline-block;
                                                      margin-bottom: 0;
                                                      color: #4E73DF;
                                                      font-weight: 600;
                                                    ">Anonymous ·</p>
                <p class="regdate" data-date="${unknown.regDate }" style="display: inline-block;
                                                          margin-bottom: 0;"></p>
                <a href="/unknown/hit?id=${unknown.id }">
                  <h5 class="mb-0 text-gray-800" data-anchor="data-anchor" id="file-input" style="font-size: 25px">${unknown.title
                    }</h5>
                </a>
              </div>
              <div class="ml-auto mb-3" style="
                    display: flex;
                ">
                <div class="col-fill ml-auto align-self-end mr-3">
                    <div class="d-flex justify-content-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                            style="min-width: 25px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true"
                            class="h-5 w-5">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z">
                            </path>
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg><span>${unknown.hit}</span></div>
                </div>
                <div class="col-fill ml-auto align-self-end mr-5">
                    <div class="d-flex justify-content-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
                            style="min-width: 25px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true"
                            class="h-5 w-5">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M8.625 9.75a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375m-13.5 3.01c0 1.6 1.123 2.994 2.707 3.227 1.087.16 2.185.283 3.293.369V21l4.184-4.183a1.14 1.14 0 01.778-.332 48.294 48.294 0 005.83-.498c1.585-.233 2.708-1.626 2.708-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z">
                            </path>
                        </svg><span>${unknown.cntComment}</span></div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <c:if test="${pager.pre }">
            <li class="page-item"><a class="page-link"
                href="./list?page=${pager.startNum - 1 }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">Previous</a>
            </li>
          </c:if>

          <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
            <li class="page-item"><a class="page-link"
                href="./list?page=${i }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">${i }</a></li>
          </c:forEach>

          <c:if test="${pager.next }">
            <li class="page-item"><a class="page-link"
                href="./list?page=${pager.lastNum + 1 }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">Next</a></li>
          </c:if>

        </ul>
      </nav>
    </div>