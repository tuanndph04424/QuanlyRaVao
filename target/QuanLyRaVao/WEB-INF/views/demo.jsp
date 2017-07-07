<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="item" items="${departmentshow}">
							<tr>

								<td>${item.ID}</td>
						
								<td>${item.Name}</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn-xs" data-title="Edit"
											data-toggle="modal" data-target="#edit">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</p></td>
							</tr>

						</c:forEach>
